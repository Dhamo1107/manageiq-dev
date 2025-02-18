module ApplicationController::Buttons
  extend ActiveSupport::Concern

  included do
    include Mixins::PlaybookOptions
    include CustomButtonHelper
  end

  def ab_group_edit
    assert_privileges("ab_group_edit")
    group_new_edit("edit")
  end

  def ab_group_new
    assert_privileges("ab_group_new")
    group_new_edit("new")
  end

  def ab_group_reorder
    assert_privileges("ab_group_reorder")
    case params[:button]
    when "cancel"
      add_flash(_("Button Group Reorder cancelled"))
      @edit = session[:edit] = nil # clean out the saved info
      ab_get_node_info(x_node) if x_active_tree == :ab_tree
      replace_right_cell(:nodetype => x_node)
    when "save"
      return unless load_edit("group_reorder", "replace_cell__explorer")

      # save group_index of each custombuttonset in set_data
      if x_active_tree == :sandt_tree
        button_order = []
        st = ServiceTemplate.find(@sb[:applies_to_id])
      end
      @edit[:new][:fields].each_with_index do |field, i|
        field_nodes = field.last.split('-')
        button_order.push(field.last) if x_active_tree == :sandt_tree
        next if field_nodes.first != "cbg"

        cs = CustomButtonSet.find(field_nodes.last)
        cs.set_data[:group_index] = i + 1
        cs.save!
      end

      if x_active_tree == :sandt_tree
        st.options[:button_order] = button_order
        st.save
      end
      add_flash(_("Button Group Reorder saved"))
      @edit = session[:edit] = nil # clean out the saved info
      ab_get_node_info(x_node) if x_active_tree == :ab_tree
      replace_right_cell(:nodetype => x_node, :replace_trees => x_active_tree == :ab_tree ? [:ab] : [:sandt])
    else
      if params[:button] == "reset"
        @changed = session[:changed] = false
        add_flash(_("All changes have been reset"), :warning)
      end
      group_reorder_set_form_vars
      @in_a_form = true
      @lastaction = "automate_button"
      @layout = "miq_ae_automate_button"
      replace_right_cell(:nodetype => "group_reorder", :action => "group_reorder")
    end
  end

  def group_reorder_field_changed
    assert_privileges("ab_group_reorder")
    if params['selected_fields']
      return unless load_edit("group_reorder", "replace_cell__explorer")

      move_cols_up if params[:button] == "up"
      move_cols_down if params[:button] == "down"
      @changed = (@edit[:new] != @edit[:current])
      @refresh_partial = "group_order_form"
      render :update do |page|
        page << javascript_prologue
        page.replace("flash_msg_div", :partial => "layouts/flash_msg") unless @refresh_div && @refresh_div != "column_lists"
        page << "miqScrollTop();" if @flash_array.present?
        page.replace(@refresh_div, :partial => "shared/buttons/#{@refresh_partial}") if @refresh_div
        page << "miqSparkle(false);"
        page << javascript_for_miq_button_visibility_changed(@changed)
      end
    else
      add_flash(_("No Button Group was selected!"), :error)
      javascript_flash
    end
  end

  def group_create
    assert_privileges("ab_group_new")
    group_create_update("create")
  end

  def group_update
    assert_privileges("ab_group_edit")
    group_create_update("update")
  end

  # Provider, Service, User, Group, Tenant, Cloud Tenant, Generic Object
  # we need a "Provider" so adding an "ExtManagementSystem" to the list.
  MODEL_WITH_OPEN_URL = %w[ExtManagementSystem Service User MiqGroup Tenant CloudTenant GenericObject Vm].freeze

  def automate_button_field_changed
    assert_privileges(feature_by_action)

    unless params[:target_class]
      @edit = session[:edit]
      @custom_button = @edit[:custom_button]
      if params[:readonly]
        @edit[:new][:readonly] = (params[:readonly] != "1")
      end
      copy_params_if_set(@edit[:new], params, %i[instance_name other_name object_message object_request])
      ApplicationController::AE_MAX_RESOLUTION_FIELDS.times do |i|
        f = ("attribute_" + (i + 1).to_s)
        v = ("value_" + (i + 1).to_s)
        @edit[:new][:attrs][i][0] = params[f] if params[f.to_sym]
        @edit[:new][:attrs][i][1] = params[v] if params[v.to_sym]
      end
      @edit[:new][:display] = params[:display] == "1" if params[:display]
      @edit[:new][:open_url] = params[:open_url] == "1" if params[:open_url]

      copy_params_if_set(@edit[:new], params, %i[name target_attr_name display_for submit_how description button_icon button_color disabled_text button_type inventory_type])
      @edit[:new][:disabled_open_url] = !(MODEL_WITH_OPEN_URL.include?(@resolve[:target_class]) && @edit[:new][:display_for] == 'single')
      @edit[:new][:open_url] = false if @edit[:new][:disabled_open_url]
      @edit[:new][:dialog_id] = nil if params[:display_for].present? && params[:display_for] != 'single'

      @edit[:new][:dialog_id] = params[:dialog_id] == "" ? nil : params[:dialog_id] if params.key?("dialog_id")
      visibility_box_edit

      if params[:button_type] == 'default'
        clear_playbook_variables
      end
      if params[:button_type] == 'ansible_playbook'
        initialize_playbook_variables
        @edit[:new][:dialog_id] = nil
        @edit[:new][:object_request] = CustomButton::PLAYBOOK_METHOD
      end
    end

    render :update do |page|
      page << javascript_prologue
      if %i[display_for instance_name other_name target_class button_type].any? { |k| params.key?(k) }
        @sb[:active_tab] = params[:instance_name] ? "ab_advanced_tab" : "ab_options_tab"
        page.replace("ab_form", :partial => "shared/buttons/ab_form")
      end
      if params[:visibility_typ]
        page.replace("form_role_visibility", :partial => "layouts/role_visibility", :locals => {:rec_id => (@custom_button.id || "new").to_s, :action => "automate_button_field_changed"})
      end
      unless params[:target_class]
        @changed = session[:changed] = (@edit[:new] != @edit[:current])
        page << javascript_for_miq_button_visibility(@changed)
      end
      page << "miqSparkle(false);"
    end
  end

  def ab_button_new
    assert_privileges("ab_button_new")
    button_new_edit("new")
  end

  def ab_button_edit
    assert_privileges("ab_button_edit")
    button_new_edit("edit")
  end

  def button_update
    assert_privileges("ab_button_edit")
    button_create_update("update")
  end

  def button_create
    assert_privileges("ab_button_new")
    button_create_update("create")
  end

  def group_form_valid
    required = %i[name description button_icon]

    required.none? do |field|
      @edit[:new][field].blank?
    end
  end

  def open_url_after_dialog
    external_url = ExternalUrl.find_by(
      :resource_id   => params[:targetId],
      :resource_type => params[:realTargetType],
      :user          => User.current_user
    )
    # FIXME: remove this fallback once the ':remote_console_url=' is removed from automate
    external_url ||= SystemConsole.find_by(:vm_id => params[:targetId])

    url = external_url.try(:url)

    render :json => {:open_url => url}
  end

  private

  def feature_by_action
    features_in_action = %w[ab_button_new ab_button_edit]
    @sb[:action] if features_in_action.include?(@sb[:action])
  end

  BASE_MODEL_EXPLORER_CLASSES = [MiqGroup, MiqTemplate, Service, Tenant, User, Vm].freeze

  def custom_button_done
    external_url = ExternalUrl.find_by(
      :resource_id   => params[:id],
      :resource_type => params[:base_cls],
      :user          => User.current_user
    )
    # FIXME: remove this fallback once the ':remote_console_url=' is removed from automate
    external_url ||= SystemConsole.find_by(:vm_id => params[:id])

    url = external_url.try(:url)
    if url.present?
      javascript_open_window(url)
    else
      render_flash(_('No url was returned from automate.'), :error)
    end
  end

  def custom_buttons_invoke(button, objs)
    if objs.length > 1 &&
       (button.options&.key?(:submit_how) && button.options[:submit_how].to_s == 'all')
      button.invoke(objs, 'UI')
    else
      objs.each { |obj| button.invoke(obj, 'UI') }
    end
  end

  def sync_playbook_dialog(button)
    service_template = ServiceTemplate.find_by(:name => button.uri_attributes[:service_template_name])
    dialog_id = nil
    service_template&.resource_actions&.each do |ra|
      d = Dialog.where(:id => ra.dialog_id).first
      dialog_id = d.id if d
    end
    if dialog_id && button.resource_action.dialog_id != dialog_id
      button.resource_action.dialog_id = dialog_id
      button.save
    end
  end

  def custom_buttons(ids = nil, display_options = {})
    button = CustomButton.find(params[:button_id])
    cls = custom_button_class_model(button.applies_to_class)
    @explorer = true if BASE_MODEL_EXPLORER_CLASSES.include?(cls)
    ids ||= params[:id] unless relationship_table_screen? && @record.nil?
    ids = find_checked_items if ids == 'LIST' || ids.nil?

    if ids.blank?
      render_flash(_("Error launching custom button: No item was selected."), :error)
      return
    end

    objs = Rbac.filtered(cls.where(:id => ids))
    obj = objs.first

    if objs.empty?
      render_flash(_("Error launching custom button: No item was selected."), :error)
      return
    end

    @right_cell_text = _("%{record} - \"%{button_text}\"") % {:record => obj.name, :button_text => button.name}

    if button.resource_action.dialog_id
      sync_playbook_dialog(button) if button.options.try(:[], :button_type) == 'ansible_playbook'
      options = {
        :header     => @right_cell_text,
        :target_id  => obj.id,
        :target_ids => objs.collect(&:id),
        :target_kls => obj.class.name,
      }

      options[:dialog_locals] = DialogLocalService.new.determine_dialog_locals_for_custom_button(obj, button.name, button.resource_action, display_options)
      options[:dialog_locals][:open_url] = button.options.present? && button.options.fetch_path(:open_url)
      options.merge!(display_options) unless display_options.empty?
      dialog_initialize(button.resource_action, options)

    elsif button.options.present? && button.options.fetch_path(:open_url)
      # not supported for objs: cannot do wait for task for multiple tasks
      task_id = button.invoke_async(obj, 'UI')
      initiate_wait_for_task(
        :task_id      => task_id,
        :action       => :custom_button_done,
        :extra_params => { :base_cls => cls.base_class.to_s }
      )

    else
      begin
        custom_buttons_invoke(button, objs)
      rescue StandardError => bang
        add_flash(_("Error launching: \"%{task_description}\" %{error_message}") %
          {:task_description => params[:desc], :error_message => bang.message}, :error)
      else
        add_flash(_("\"%{task_description}\" was launched") % {:task_description => params[:desc]})
      end
      javascript_flash
    end
  end

  def load_available_dialogs
    @edit[:new][:available_dialogs] = {}
    Dialog.all.each do |d|
      @edit[:new][:available_dialogs][d.id] = d.label
    end
  end

  def group_button_cancel(typ)
    if typ == "update"
      add_flash(_("Edit of Button Group \"%{name}\" was cancelled by the user") % {:name => @edit[:current][:name]})
    else
      add_flash(_("Add of new Button Group was cancelled by the user"))
    end
    @edit = session[:edit] = nil # clean out the saved info
    ab_get_node_info(x_node) if x_active_tree == :ab_tree
    replace_right_cell(:nodetype => x_node)
  end

  def group_button_add_save(typ)
    assert_privileges(params[:button] == "add" ? "ab_group_new" : "ab_group_edit")
    if typ == "update"
      update_page_content("saved")
    else
      all_sets = CustomButtonSet.find_all_by_class_name(params[:applies_to_class])
      all_sets.each_with_index do |group, i|
        group.set_data[:group_index] = i + 1
        group.save!
      end
      if x_active_tree == :sandt_tree
        aset = CustomButtonSet.find_by(:id => params[:id])
        # push new button at the end of button_order array
        if aset
          st = ServiceTemplate.find(@sb[:applies_to_id])
          st.custom_button_sets.push(aset)
          st.options[:button_order] ||= []
          st.options[:button_order].push("cbg-#{aset.id}")
          st.save
        end
      end
      update_page_content("added")
    end
  end

  def update_page_content(action)
    add_flash("Button Group #{params[:name]} was #{action}")
    @edit = session[:edit] = nil # clean out the saved info
    ab_get_node_info(x_node) if x_active_tree == :ab_tree
    replace_right_cell(:nodetype => x_node, :replace_trees => x_active_tree == :ab_tree ? [:ab] : [:sandt])
  end

  def group_create_update(typ)
    @edit = session[:edit]
    @record = @custom_button_set = @edit[:custom_button_set_id] ? CustomButtonSet.find(@edit[:custom_button_set_id]) : CustomButtonSet.new
    @changed = (@edit[:new] != @edit[:current])
    case params[:button]
    when 'cancel'      then group_button_cancel(typ)
    when 'add', 'save' then group_button_add_save(typ)
    end
  end

  def button_create_update(typ)
    @edit = session[:edit]
    @record = @custom_button = @edit[:custom_button]
    @changed = (@edit[:new] != @edit[:current])

    case params[:button]
    when 'cancel' then ab_button_cancel(typ)
    when 'add'    then ab_button_add
    when 'save'   then ab_button_save
    when 'reset'  then ab_button_reset
    when 'enablement_expression', 'visibility_expression' then ab_expression
    end
  end

  def ab_expression
    @changed = session[:changed] = (@edit[:new] != @edit[:current])
    @expkey = params[:button].to_sym
    @edit[:visibility_expression_table] = exp_build_table_or_nil(@edit[:new][:visibility_expression])
    @edit[:enablement_expression_table] = exp_build_table_or_nil(@edit[:new][:enablement_expression])
    @in_a_form = true
    @sb[:active_tab] = "ab_advanced_tab"
    replace_right_cell(:action => 'button_edit')
  end

  def ab_button_cancel(typ)
    if typ == "update"
      add_flash(_("Edit of Custom Button \"%{name}\" was cancelled by the user") % {:name => @edit[:current][:name]})
    else
      add_flash(_("Add of new Custom Button was cancelled by the user"))
    end
    @edit = session[:edit] = nil
    ab_get_node_info(x_node) if x_active_tree == :ab_tree
    replace_right_cell(:nodetype => x_node)
  end

  def ab_button_add
    assert_privileges("ab_button_new")
    @sb[:active_tab] = "ab_options_tab"
    @resolve = session[:resolve]
    name = @edit[:new][:instance_name].presence || @edit[:new][:other_name]

    unless button_valid?
      @breadcrumbs = []
      drop_breadcrumb(:name => _("Edit of Button"), :url => "/miq_ae_customization/button_edit")
      @lastaction = "automate_button"
      @layout = "miq_ae_automate_button"
      if @switch_tab
        render :update do |page|
          page << javascript_prologue
          page.replace("flash_msg_div", :partial => "layouts/flash_msg")
          page << "miqScrollTop();" if @flash_array.present?
          page << "document.querySelector(\"#ab_advanced_tab_tab > a\").click();"
        end
      else
        javascript_flash
      end
      return
    end

    attrs = {}
    @edit[:new][:attrs].each do |a|
      attrs[a[0].to_sym] = a[1] if a[0].present?
    end
    @edit[:uri] = MiqAeEngine.create_automation_object(name, attrs, :fqclass => @edit[:new][:starting_object], :message => @edit[:new][:object_message])
    @edit[:new][:description] = @edit[:new][:description].strip == "" ? nil : @edit[:new][:description] unless @edit[:new][:description].nil?
    button_set_record_vars(@custom_button)
    nodes = x_node.split('_')
    if nodes[0].split('-')[1] != "ub" && nodes.length >= 2
      # if group is not unassigned group, add uri as a last member  of the group
      if x_active_tree == :ab_tree || nodes.length > 2
        # find custombutton set in ab_tree or when adding button under a group
        group_id = nodes[2].split('-').last
        @aset = CustomButtonSet.find(group_id)
      end
    end

    if @custom_button.save
      add_flash(_("Custom Button \"%{name}\" was added") % {:name => @edit[:new][:description]})
      @edit = session[:edit] = nil
      au = CustomButton.find(@custom_button.id)
      if @aset && nodes[0].split('-')[1] != "ub" && nodes.length >= 2
        # if group is not unassigned group, add uri as a last member  of the group
        @aset.set_data[:button_order] ||= []
        @aset.set_data[:button_order].push(au.id)
        @aset.save!
      end
      if x_active_tree == :sandt_tree
        # push new button at the end of button_order array
        st = ServiceTemplate.find(@sb[:applies_to_id])
        st.custom_buttons.push(au) if nodes.length >= 2 && nodes[1].split('-').first != "cbg"
        st.options[:button_order] ||= []
        st.options[:button_order].push("cb-#{au.id}")
        st.save
      end

      ab_get_node_info(x_node) if x_active_tree == :ab_tree
      replace_right_cell(:nodetype => x_node, :replace_trees => x_active_tree == :ab_tree ? [:ab] : [:sandt])
    else
      @custom_button.errors.each do |error|
        add_flash(_("Error during 'add': %{error_message}") %
          {:error_message => @custom_button.errors.full_message(error.attribute, error.message)}, :error)
      end
      @lastaction = "automate_button"
      @layout = "miq_ae_automate_button"
      javascript_flash
    end
  end

  def ab_button_save
    assert_privileges("ab_button_edit")
    @resolve = session[:resolve]
    attrs = {}
    @sb[:active_tab] = "ab_options_tab"
    @edit[:new][:attrs].each do |a|
      attrs[a[0].to_sym] = a[1] if a[0].present?
    end
    @edit[:uri] = MiqAeEngine.create_automation_object(ab_button_name, attrs, :fqclass => @edit[:new][:starting_object], :message => @edit[:new][:object_message])
    @edit[:new][:description] = @edit[:new][:description].strip == "" ? nil : @edit[:new][:description] unless @edit[:new][:description].nil?

    unless button_valid?
      @breadcrumbs = []
      drop_breadcrumb(:name => _("Edit of Button"), :url => "/miq_ae_customization/button_edit")
      @lastaction = "automate_button"
      @layout = "miq_ae_automate_button"
      if @switch_tab
        render :update do |page|
          page << javascript_prologue
          page.replace("flash_msg_div", :partial => "layouts/flash_msg")
          page << "miqScrollTop();" if @flash_array.present?
          page << "document.querySelector(\"#ab_advanced_tab_tab > a\").click();"
        end
      else
        javascript_flash
      end
      return
    end

    button_set_record_vars(@custom_button)

    if @custom_button.save
      add_flash(_("Custom Button \"%{name}\" was saved") % {:name => @edit[:new][:description]})
      @edit = session[:edit] = nil
      ab_get_node_info(x_node) if x_active_tree == :ab_tree
      build_filter_exp_table
      replace_right_cell(:nodetype => x_node, :replace_trees => x_active_tree == :ab_tree ? [:ab] : [:sandt])
    else
      @custom_button.errors.each do |error|
        add_flash(_("Error during 'edit': %{field_name} %{error_message}") %
          {:field_name => error.attribute.to_s.capitalize, :error_message => error.message}, :error)
      end
      @breadcrumbs = []
      drop_breadcrumb(:name => "Edit of Button", :url => "/miq_ae_customization/button_edit")
      @lastaction = "automate_button"
      @layout = "miq_ae_automate_button"
      javascript_flash
    end
  end

  def ab_button_reset
    button_set_form_vars
    @changed = session[:changed] = false
    @sb[:active_tab] = "ab_options_tab"
    add_flash(_("All changes have been reset"), :warning)
    @in_a_form = true
    @breadcrumbs = []
    drop_breadcrumb(:name => _("Edit of Button"), :url => "/miq_ae_customization/button_edit")
    @lastaction = "automate_button"
    @layout = "miq_ae_automate_button"
    replace_right_cell(:action => "button_edit")
  end

  # Set form variables for button add/edit
  def group_reorder_set_form_vars
    @edit = {}
    @edit[:new] = {}
    @edit[:current] = {}
    @edit[:key] = "group_reorder"
    @edit[:new][:fields] = []
    @sb[:buttons_node] = true
    if x_active_tree == :ab_tree
      groups = CustomButtonSet.find_all_by_class_name(x_node.split('_').last)
      groups.each do |g|
        @edit[:new][:fields].push([g.name.split('|').first, "#{g.kind_of?(CustomButton) ? 'cb' : 'cbg'}-#{g.id}"])
      end
    else
      st = ServiceTemplate.find(@sb[:applies_to_id])
      groups = st.custom_button_sets + st.custom_buttons
      if st.options && st.options[:button_order]
        st.options[:button_order].each do |item_id|
          groups.each do |g|
            rec_id = "#{g.kind_of?(CustomButton) ? 'cb' : 'cbg'}-#{g.id}"
            @edit[:new][:fields].push([g.name.split('|').first, rec_id]) if item_id == rec_id
          end
        end
      end
    end

    @edit[:current] = copy_hash(@edit[:new])
    @sb[:button_groups] = nil
    @sb[:buttons] = nil
    session[:edit] = @edit
  end

  def group_new_edit(typ)
    @record = @custom_button_set = typ == "new" ? CustomButtonSet.new : CustomButtonSet.find(params[:id])
    if typ == "edit" && x_node.split('_').last == "ub"
      add_flash(_("'Unassigned Button Group' can not be edited"), :error)
      get_node_info
      replace_right_cell(:nodetype => x_node)
      return
    end
    group_set_form_vars
    @right_cell_text = if typ == "new"
                         _("Adding a new Button Group")
                       else
                         _("Editing Button Group \"%{name}\"") % {:name => @custom_button_set.name.split('|').first}
                       end
    @in_a_form = true
    @lastaction = "automate_button"
    @layout = "miq_ae_automate_button"
    @sb[:button_groups] = nil
    @sb[:buttons] = nil

    # Symbol selection based on active controller
    if controller_path == 'miq_ae_customization'
      replace_right_cell(:nodetype => 'group_edit')
    else
      replace_right_cell(:action => 'group_edit')
    end
  end

  def button_new_edit(typ)
    @record = @custom_button = typ == "new" ? CustomButton.new : CustomButton.find(params[:id])
    @sb[:active_tab] = "ab_options_tab"
    button_set_form_vars
    @in_a_form = true
    @changed = session[:changed] = false
    @breadcrumbs = []
    @right_cell_text = if typ == "new"
                         _("Adding a new Button")
                       else
                         _("Editing Button \"%{name}\"") % {:name => @custom_button.name}
                       end
    @lastaction = "automate_button"
    @layout = "miq_ae_automate_button"
    @sb[:buttons] = nil
    @sb[:button_groups] = nil

    # Symbol selection based on active controller
    if controller_path == 'miq_ae_customization'
      replace_right_cell(:nodetype => 'button_edit')
    else
      replace_right_cell(:action => 'button_edit')
    end
  end

  # Set form variables for button add/edit
  def group_set_form_vars
    @sb[:buttons_node] = true
    if session[:resolve]
      @resolve = session[:resolve]
    else
      build_resolve_screen
    end
    @edit = {}
    @edit[:new] = {}
    @edit[:current] = {}
    @edit[:key] = "bg_edit__#{@custom_button_set.id || "new"}"
    @edit[:custom_button_set_id] = @custom_button_set.id
    @edit[:rec_id] = @custom_button_set.try(:id)
    @edit[:new][:name] = @custom_button_set[:name].split("|").first if @custom_button_set[:name].present?
    @edit[:new][:applies_to_class] = @custom_button_set[:set_data] && @custom_button_set[:set_data][:applies_to_class] ? @custom_button_set[:set_data][:applies_to_class] : @sb[:applies_to_class]
    @edit[:new][:description] = @custom_button_set.description
    @edit[:new][:button_icon] = @custom_button_set[:set_data] && @custom_button_set[:set_data][:button_icon] ? @custom_button_set[:set_data][:button_icon] : ""
    @edit[:new][:button_color] = @custom_button_set[:set_data] && @custom_button_set[:set_data][:button_color] ? @custom_button_set[:set_data][:button_color] : ""
    @edit[:new][:display] = @custom_button_set[:set_data] && @custom_button_set[:set_data].key?(:display) ? @custom_button_set[:set_data][:display] : true
    @edit[:new][:fields] = []

    button_order = @custom_button_set[:set_data].try(:[], :button_order)
    if button_order # show assigned buttons in order they were saved
      button_order.each do |bidx|
        @custom_button_set.members.each do |mem|
          @edit[:new][:fields].push([mem.name, mem.id]) if bidx == mem.id && !@edit[:new][:fields].include?([mem.name, mem.id])
        end
      end
    else
      @custom_button_set.members.each do |mem|
        @edit[:new][:fields].push([mem.name, mem.id])
      end
    end
    @edit[:new][:available_fields] =
      CustomButton.buttons_for(@sb[:applies_to_class])
                  .select { |u| u.custom_button_sets.blank? }
                  .sort_by(&:name)
                  .collect { |u| [u.name, u.id] }
    @edit[:current] = copy_hash(@edit[:new])
    session[:edit] = @edit
  end

  def move_cols_top
    if params[:selected_fields].blank? || params[:selected_fields][0] == ""
      add_flash(_("No fields were selected to move top"), :error)
      return
    end
    consecutive, first_idx, last_idx = selected_consecutive?
    if !consecutive
      add_flash(_("Select only one or consecutive fields to move to the top"), :error)
    else
      if first_idx.positive?
        @edit[:new][:fields][first_idx..last_idx].reverse_each do |field|
          pulled = @edit[:new][:fields].delete(field)
          @edit[:new][:fields].unshift(pulled)
        end
      end
      @refresh_div = "column_lists"
      @refresh_partial = "column_lists"
    end
    @selected = params[:selected_fields]
  end

  def move_cols_bottom
    if params[:selected_fields].blank? || params[:selected_fields][0] == ""
      add_flash(_("No fields were selected to move bottom"), :error)
      return
    end
    consecutive, first_idx, last_idx = selected_consecutive?
    if !consecutive
      add_flash(_("Select only one or consecutive fields to move to the bottom"), :error)
    else
      if last_idx < @edit[:new][:fields].length - 1
        @edit[:new][:fields][first_idx..last_idx].each do |field|
          pulled = @edit[:new][:fields].delete(field)
          @edit[:new][:fields].push(pulled)
        end
      end
      @refresh_div = "column_lists"
      @refresh_partial = "column_lists"
    end
    @selected = params[:selected_fields]
  end

  def ab_button_name(button_hash = @edit[:new])
    button_hash[:instance_name].presence || button_hash[:instance_name]
  end

  def button_valid?(button_hash = @edit[:new])
    add_flash(_("Button Name is required"), :error) if button_hash[:name].blank? || button_hash[:name].strip.blank?

    if button_hash[:button_icon].blank?
      add_flash(_("Button Icon must be selected"), :error)
    end

    add_flash(_("Button Description is required"), :error) if button_hash[:description].blank?

    if button_hash[:visibility_typ] == "role" && button_hash[:roles].blank?
      add_flash(_("At least one Role must be selected"), :error)
    end

    if button_hash[:open_url] == true && button_hash[:display_for] != 'single'
      add_flash(_('URL can be opened only by buttons for a single entity'), :error)
    end

    if (button_hash[:dialog_id].present? && !button_hash[:dialog_id].to_i.zero?) && button_hash[:display_for] != 'single'
      add_flash(_('Dialog can be opened only by buttons for a single entity'), :error)
    end

    validate_playbook_button(button_hash) if button_hash[:button_type] == "ansible_playbook"

    if ab_button_name(button_hash).blank?
      add_flash(_("Starting Process is required"), :error)
      @switch_tab = true if @flash_array.length == 1
    end

    if button_hash[:object_request].blank?
      add_flash(_("Request is required"), :error)
      @switch_tab = true if @flash_array.length == 1
    end

    !flash_errors?
  end

  def validate_playbook_button(button_hash)
    if button_hash[:service_template_id].blank? || button_hash[:service_template_id].zero?
      add_flash(_("An Ansible Playbook must be selected"), :error)
    end
    if button_hash[:inventory_type] == 'manual' && button_hash[:hosts].blank?
      add_flash(_("At least one host must be specified for manual mode"), :error)
    end
  end

  # Set user record variables to new values
  def button_set_record_vars(button)
    button.name = @edit[:new][:name]
    button.description = @edit[:new][:description]
    button.applies_to_class = x_active_tree == :ab_tree ? @resolve[:target_class] : "ServiceTemplate"
    button.applies_to_id = x_active_tree == :ab_tree ? nil : @sb[:applies_to_id]
    button.userid = session[:userid]
    button.uri = @edit[:uri]
    button[:options] = {}
    button.disabled_text = @edit[:new][:disabled_text]
    button.uri_path, button.uri_attributes, button.uri_message = CustomButton.parse_uri(@edit[:uri])
    button.uri_attributes["request"] = @edit[:new][:object_request]
    button.options[:button_icon] = @edit[:new][:button_icon] if @edit[:new][:button_icon].present?
    button.options[:button_color] = @edit[:new][:button_color] if @edit[:new][:button_color].present?

    %i[button_type display open_url display_for submit_how].each do |key|
      button[:options][key] = @edit[:new][key]
    end
    button.visibility ||= {}
    if @edit[:new][:visibility_typ] == "role"
      roles = []
      @edit[:new][:roles].each do |r|
        role = MiqUserRole.find_by(:id => r)
        roles.push(role.name) if role
      end
      button.visibility[:roles] = roles
    else
      button.visibility[:roles] = ["_ALL_"]
    end
    button_set_resource_action(button)
    if @edit[:new][:display_for] == "single"
      button_set_expressions_record(button)
    else
      button.visibility_expression = button.enablement_expression = nil
    end
    button_set_playbook_record(button)
  end

  def button_set_expressions_record(button)
    exp_remove_tokens(@edit[:new][:visibility_expression])
    exp_remove_tokens(@edit[:new][:enablement_expression])
    button.visibility_expression = @edit[:new][:visibility_expression]["???"] ? nil : MiqExpression.new(@edit[:new][:visibility_expression])
    button.enablement_expression = @edit[:new][:enablement_expression]["???"] ? nil : MiqExpression.new(@edit[:new][:enablement_expression])
  end

  def field_expression_model
    @custom_button.applies_to_class ||= (x_active_tree == :ab_tree ? @resolve[:target_class] : "ServiceTemplate")
  end

  def button_set_expression_vars(field_expression, field_expression_table)
    @edit[:new][field_expression] = @custom_button[field_expression].kind_of?(MiqExpression) ? @custom_button[field_expression].exp : nil
    # Populate exp editor fields for the expression column
    @edit[field_expression] ||= ApplicationController::Filter::Expression.new
    @edit[field_expression][:expression] = [] # Store exps in an array
    if @edit[:new][field_expression].blank?
      @edit[field_expression][:expression] = {"???" => "???"} # Set as new exp element
      @edit[:new][field_expression] = copy_hash(@edit[field_expression][:expression]) # Copy to new exp
    else
      @edit[field_expression][:expression] = copy_hash(@edit[:new][field_expression])
    end
    @edit[field_expression_table] = exp_build_table_or_nil(@edit[field_expression][:expression])

    @expkey = field_expression # Set expression key to expression
    @edit[field_expression].history.reset(@edit[field_expression][:expression])
    @edit[field_expression][:exp_table] = exp_build_table(@edit[field_expression][:expression])
    @edit[field_expression][:exp_model] = field_expression_model # Set model for the exp editor
  end

  def button_set_resource_action(button)
    d = @edit[:new][:dialog_id].nil? ? nil : Dialog.find(@edit[:new][:dialog_id])
    # if resource_Action is there update it else create new one
    ra = button.resource_action
    if ra
      ra.dialog = d
      ra.save
    else
      attrs = {:dialog => d}
      button.resource_action.build(attrs)
    end
  end

  def button_set_playbook_record(button)
    if @edit[:new][:button_type] == 'ansible_playbook'
      target = case @edit[:new][:inventory_type]
               when "event_target"
                 'vmdb_object'
               when "manual"
                 @edit[:new][:hosts]
               when 'localhost'
                 'localhost'
               end
      attrs = {:service_template_name => ServiceTemplate.find(@edit[:new][:service_template_id]).name, :hosts => target}
      button.uri_attributes.merge!(attrs)
    end
  end

  def button_set_playbook_form_vars
    @edit[:ansible_playbooks] = ServiceTemplateAnsiblePlaybook.order(:name).pluck(:name, :id) || []
    service_template = ServiceTemplate.find_by(:name => @custom_button.uri_attributes[:service_template_name])
    @edit[:new][:service_template_id] = service_template.try(:id)

    service_template&.resource_actions&.each do |ra|
      d = Dialog.where(:id => ra.dialog_id).first
      @edit[:new][:dialog_id] = d.id if d
    end

    @edit[:new][:inventory_type] = if @custom_button.uri_attributes[:hosts].blank?
                                     'localhost'
                                   else
                                     case @custom_button.uri_attributes[:hosts]
                                     when 'vmdb_object'
                                       "event_target"
                                     when 'localhost'
                                       "localhost"
                                     else
                                       @edit[:new][:hosts] = @custom_button.uri_attributes[:hosts]
                                       "manual"
                                     end
                                   end
  end

  # Set form variables for button add/edit
  def button_set_form_vars
    @sb[:buttons_node] = true
    @edit = {}
    if session[:resolve] && session[:resolve][:instance_name]
      @resolve = session[:resolve]
    else
      build_resolve_screen
    end
    @resolve[:target_class] = if x_active_tree == :sandt_tree
                                "ServiceTemplate"
                              elsif x_node.starts_with?("-ub-")
                                x_node.sub(/-ub-([^_]+)(_.*)?/, '\1')
                              else
                                x_node.sub(/xx-ab_([^_]+)_.*/, '\1')
                              end
    @record = @edit[:custom_button] = @custom_button
    @edit[:instance_names] = Array(@resolve[:instance_names])
    @edit[:new] = {}
    @edit[:current] = {}
    @edit[:new][:attrs] ||= []
    @edit[:rec_id] = @custom_button.try(:id)
    if @custom_button.uri_attributes
      instance_name = @custom_button.uri_object_name
      if @edit[:instance_names].include?(instance_name)
        @edit[:new][:instance_name] = instance_name
      else
        @edit[:new][:other_name] = instance_name
      end
      @edit[:new][:object_request] = @custom_button.uri_attributes["request"]

      button_type = @custom_button.options.try(:[], :button_type) ? @custom_button.options[:button_type] : 'default'
      default_attributes = %w[request]
      default_attributes = %w[request service_template_name hosts] if button_type == 'ansible_playbook'

      @custom_button.uri_attributes.each do |attr|
        if attr[0] != "object_name" && !default_attributes.include?(attr[0].to_s)
          @edit[:new][:attrs].push(attr) unless @edit[:new][:attrs].include?(attr)
        end
      end
    end
    (ApplicationController::AE_MAX_RESOLUTION_FIELDS - @edit[:new][:attrs].length).times { @edit[:new][:attrs].push([]) }
    @edit[:new][:starting_object] ||= "SYSTEM/PROCESS"
    @edit[:new][:instance_name] ||= "Request"

    @edit[:new].update(
      :target_class   => @resolve[:target_class],
      :name           => @custom_button.name,
      :description    => @custom_button.description,
      :button_icon    => @custom_button.options.try(:[], :button_icon),
      :button_color   => @custom_button.options.try(:[], :button_color),
      :disabled_text  => @custom_button.disabled_text,
      :display        => @custom_button.options.try(:[], :display).nil? ? true : @custom_button.options[:display],
      :open_url       => @custom_button.options.try(:[], :open_url) ? @custom_button.options[:open_url] : false,
      :display_for    => @custom_button.options.try(:[], :display_for) ? @custom_button.options[:display_for] : 'single',
      :submit_how     => @custom_button.options.try(:[], :submit_how) ? @custom_button.options[:submit_how] : 'one',
      :button_type    => button_type,
      :object_message => @custom_button.uri_message || "create"
    )
    button_set_expression_vars(:enablement_expression, :enablement_expression_table)
    button_set_expression_vars(:visibility_expression, :visibility_expression_table)

    @edit[:new][:disabled_open_url] = !(MODEL_WITH_OPEN_URL.include?(@resolve[:target_class]) && @edit[:new][:display_for] == 'single')

    @edit[:current] = copy_hash(@edit[:new])

    @edit[:visibility_types] = [["<#{_('To All')}>", "all"], ["<#{_('By Role')}>", "role"]]
    # Visibility Box
    if @custom_button.visibility && @custom_button.visibility[:roles]
      @edit[:new][:visibility_typ] = @custom_button.visibility[:roles][0] == "_ALL_" ? "all" : "role"
      if @custom_button.visibility[:roles][0] == "_ALL_"
        @edit[:new][:roles] = ["_ALL_"]
      else
        @edit[:new][:roles] ||= []
        @custom_button.visibility[:roles].each do |r|
          role = MiqUserRole.find_by(:name => r)
          @edit[:new][:roles].push(role.id) if role
        end
      end
      @edit[:new][:roles].sort! if @edit[:new][:roles].present?
    end

    @edit[:sorted_user_roles] = []
    MiqUserRole.all.sort_by { |ur| ur.name.downcase }.each do |r|
      @edit[:sorted_user_roles].push(r.name => r.id)
    end
    @edit[:new][:dialog_id] = @custom_button.resource_action.dialog_id
    load_available_dialogs

    button_set_playbook_form_vars

    @edit[:current] = copy_hash(@edit[:new])
    session[:edit] = @edit
    @changed = session[:changed] = (@edit[:new] != @edit[:current])
  end

  def buttons_get_node_info(node)
    nodetype = node.split("_")
    # initializing variables to hold data for selected node
    @custom_button = nil
    @sb[:button_groups] = nil
    @sb[:buttons] = nil
    @sb[:buttons_node] = true
    @sb[:applies_to_class] = "ServiceTemplate"
    @sb[:applies_to_id] = nodetype[1].split('-').last

    if nodetype.length == 3 && nodetype[2].split('-').first == "cbg" # buttons group selected
      @sb[:applies_to_class] = "ServiceTemplate"
      @record = CustomButtonSet.find(nodetype[2].split('-').last)
      # saving id of catalogitem to use it in view to build id for right cell
      @sb[:rec_id] = @record.id
      @right_cell_text = _("Button Group \"%{name}\"") % {:name => @record.name.split("|").first}
      @sb[:buttons] = []
      button_order = @record[:set_data] && @record[:set_data][:button_order] ? @record[:set_data][:button_order] : nil
      button_order&.each do |bidx| # show assigned buttons in order they were saved
        @record.members.each do |b|
          next if bidx != b.id

          button = {
            :name         => b.name,
            :id           => b.id,
            :description  => b.description,
            :button_icon  => b.options[:button_icon],
            :button_color => b.options[:button_color],
          }
          @sb[:buttons].push(button) unless @sb[:buttons].include?(button)
        end
      end
    elsif nodetype.length >= 3 && (nodetype[2].split('-').first == "cb" || nodetype[3].split('-').first == "cb") # button selected
      id = nodetype[2].split('-').first == "cb" ? nodetype[2].split('-').last : nodetype[3].split('-').last
      @record = @custom_button = CustomButton.find(id)
      build_resolve_screen
      @resolve[:new][:attrs] = []
      if @custom_button.uri_attributes
        @custom_button.uri_attributes.each do |attr|
          if attr[0] != "object_name" && attr[0] != "request"
            @resolve[:new][:attrs].push(attr) unless @resolve[:new][:attrs].include?(attr)
          end
        end
        @resolve[:new][:object_request] = @custom_button.uri_attributes["request"]
      end
      @sb[:user_roles] = []
      if @custom_button.visibility && @custom_button.visibility[:roles] && @custom_button.visibility[:roles][0] != "_ALL_"
        MiqUserRole.all.sort_by(&:name).each do |r|
          @sb[:user_roles].push(r.name) if @custom_button.visibility[:roles].include?(r.name)
        end
      end
      @resolve[:new][:target_class] = "ServiceTemplate"
      dialog_id = @custom_button.resource_action.dialog_id
      @sb[:dialog_label] = dialog_id ? Dialog.find(dialog_id).label : _("No Dialog")
      @right_cell_text = _("Button \"%{name}\"") % {:name => @custom_button.name}
    end
    @right_cell_div = "ab_list"
  end

  def build_resolve_screen
    @resolve ||= {}
    @resolve[:new] ||= {}
    @resolve[:new][:starting_object] ||= "SYSTEM/PROCESS"
    @resolve[:new][:readonly] = false unless @resolve[:new][:readonly]
    @resolve[:throw_ready] = false

    # Following commented out since all resolutions start at SYSTEM/PROCESS
    #   @resolve[:starting_objects] = MiqAeClass.find_all_by_namespace("SYSTEM").collect{|c| c.fqname}

    matching_instances = MiqAeClass.find_distinct_instances_across_domains(current_user, @resolve[:new][:starting_object])
    if matching_instances.any?
      @resolve[:instance_names] = matching_instances.collect(&:name)
      instance_name = @custom_button&.uri_object_name
      @resolve[:new][:instance_name] = instance_name || @resolve[:new][:instance_name] || "Request"
      @resolve[:new][:object_message] = @custom_button.try(:uri_message) || @resolve[:new][:object_message] || "create"
      @resolve[:target_class] = nil
      @resolve[:target_classes] = CustomButton.button_classes.each_with_object({}) do |klass, hash|
        hash[klass] = target_class_name(klass)
      end
      @resolve[:new][:attrs] ||= []
      if @resolve[:new][:attrs].empty?
        ApplicationController::AE_MAX_RESOLUTION_FIELDS.times { @resolve[:new][:attrs].push([]) }
      else
        # add empty array if @resolve[:new][:attrs] length is less than ApplicationController::AE_MAX_RESOLUTION_FIELDS
        ApplicationController::AE_MAX_RESOLUTION_FIELDS.times { @resolve[:new][:attrs].push([]) if @resolve[:new][:attrs].length < ApplicationController::AE_MAX_RESOLUTION_FIELDS }
      end
      @resolve[:throw_ready] = ready_to_throw
    else
      add_flash(_("Simulation unavailable: Required Class \"System/Process\" is missing"), :warning)
    end
  end

  def move_cols_up
    if params[:selected_fields].blank? || params[:selected_fields][0] == ""
      add_flash(_("No fields were selected to move up"), :error)
      return
    end
    consecutive, first_idx, last_idx = selected_consecutive?
    if !consecutive
      add_flash(_("Select only one or consecutive fields to move up"), :error)
    else
      if first_idx.positive?
        @edit[:new][:fields][first_idx..last_idx].reverse_each do |field|
          pulled = @edit[:new][:fields].delete(field)
          @edit[:new][:fields].insert(first_idx - 1, pulled)
        end
      end
      @refresh_div = "column_lists"
      @refresh_partial = "column_lists"
    end
    @selected = params[:selected_fields]
  end

  def move_cols_down
    if params[:selected_fields].blank? || params[:selected_fields][0] == ""
      add_flash(_("No fields were selected to move down"), :error)
      return
    end
    consecutive, first_idx, last_idx = selected_consecutive?
    if !consecutive
      add_flash(_("Select only one or consecutive fields to move down"), :error)
    else
      if last_idx < @edit[:new][:fields].length - 1
        insert_idx = last_idx + 1 # Insert before the element after the last one
        insert_idx = -1 if last_idx == @edit[:new][:fields].length - 2 # Insert at end if 1 away from end
        @edit[:new][:fields][first_idx..last_idx].each do |field|
          pulled = @edit[:new][:fields].delete(field)
          @edit[:new][:fields].insert(insert_idx, pulled)
        end
      end
      @refresh_div = "column_lists"
      @refresh_partial = "column_lists"
    end
    @selected = params[:selected_fields]
  end

  def selected_consecutive?
    first_idx = last_idx = 0
    @edit[:new][:fields].each_with_index do |nf, idx|
      first_idx = idx if nf[1].to_s == params[:selected_fields].first
      if nf[1].to_s == params[:selected_fields].last
        last_idx = idx
        break
      end
    end
    is_consecutive = last_idx - first_idx + 1 <= params[:selected_fields].length
    [is_consecutive, first_idx, last_idx]
  end

  # Get information for a condition
  def build_filter_exp_table
    @visibility_expression_table = @custom_button.visibility_expression.kind_of?(MiqExpression) ? exp_build_table(@custom_button.visibility_expression.exp) : nil
    @enablement_expression_table = @custom_button.enablement_expression.kind_of?(MiqExpression) ? exp_build_table(@custom_button.enablement_expression.exp) : nil
  end
end
