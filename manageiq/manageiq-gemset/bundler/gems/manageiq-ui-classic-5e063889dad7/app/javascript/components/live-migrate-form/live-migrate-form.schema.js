import { componentTypes, validatorTypes } from '@@ddf';

export const createSchema = (data) => {
  const fields = [
    {
      component: componentTypes.SUB_FORM,
      name: 'MigrateInstance',
      title: __('Migrate Instance'),

      fields: [{
        component: componentTypes.CHECKBOX,
        id: 'auto_select_host',
        name: 'auto_select_host',
        label: __('Select Host?'),
	validate: [{ type: validatorTypes.REQUIRED }],
      },
     {
        component: componentTypes.CHECKBOX,
        id: 'block_migration',
        name: 'block_migration',
        label: __('Block Migration'), 
      },
      {
        component: componentTypes.CHECKBOX,
        id: 'disk_over_commit',
        name: 'disk_over_commit',
        label: __('Disk Over Commit'),
      },
      {
        component: componentTypes.SELECT,
        id: 'destination_host',
        name: 'destination_host',
        placeholder: __('<Choose>'),
        includeEmpty: true,
        options: data.options.hosts,
        label: __('Hosts'),
//        condition: {
//          when: 'auto_select_host',
//          is: true,
//        },
//	validate: [{ type: validatorTypes.REQUIRED }],	      
      },
      ],
    },
  ];
  return { fields };
};
