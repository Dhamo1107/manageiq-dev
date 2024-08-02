class ManageIQ::Providers::Ovirt::Inventory::Persister::TargetCollection < ManageIQ::Providers::Ovirt::Inventory::Persister::InfraManager
  # not added to IC properties
  # IC definitions not written like other providers (used arel property instead)
  def targeted?
    true
  end

  def strategy
    :local_db_find_missing_references
  end
end
