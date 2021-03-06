$(document).ready(function(){
  staffGrid()
})

function staffDataSource(){
    var datasource = new kendo.data.DataSource({
        transport:{
            read:{
                url: "/api/staffs",
                dataType: "json",
                // data: {class_list_id: class_list_id},
            },
        },
        schema: {
            total: 'total',
            data: 'data',
            model: {
                id: "id",
                fields: {
                    id: { type: "string", editable: false},
                    name: { type: "string", editable: true},
                }
            }
        },

        batch: true,
        pageSize: 100,
        serverPaging: false,
        serverFiltering: false,
        serverSorting: false
    });
    return datasource
}

    function staffGrid() {
        jQuery("#userinfo").kendoGrid({
            dataSource: staffDataSource(),
            resizable: true,
            pageable: {
                refresh: true,
            },
            scrollable: false,
            sortable: true,
            columns: [
                {
                    field: "first_name",
                    title: "First Name"
                },
                {
                    field: "last_name",
                    title: "Last Name"
                },
                {command: [
                    { name:"edit",text: "Edit Profile",click: edit_systems },
                    { name:"Delete", text: "Delete", click: delete_systems },
                ]
                },

            ],
        });

    }

    function edit_systems(e){
        var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
        window.location.href = "/profiles/"+dataItem.id+"/edit?profile_type=staffs"
    }

    function delete_systems(e){
        var dataItem = this.dataItem(jQuery(e.currentTarget).closest("tr"));
        doDelete("/api/profiles/"+dataItem.id,dataItem.id,'#userinfo')
    }