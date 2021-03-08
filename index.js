const connection =  require ("./mysqlconnec");
const inquirer = require ("inquirer");

const messagePrompt = {
    viewAllEmployees: "View All Employees",
    viewByDepartment: "View All Employees By Department",
    viewByManager: "View All Employees By Manager",
    addEmployee: "Add An Employee",
    removeEmployee: "Remove An Employee",
    updateRole: "Update Employee Role",
    updateEmployeeManager: "Update Employee Manager",
    viewAllRoles: "View All Roles",
    exit: "Exit"
};

function messagePrompter () {
    inquirer
        .prompt({
            name: 'action',
            type: 'list',
            message: 'What would you like to do?',
            choices: [
                messagePrompt.viewAllEmployees,
                messagePrompt.viewByDepartment,
                messagePrompt.viewByManager,
                messagePrompt.viewAllRoles,
                messagePrompt.addEmployee,
                messagePrompt.removeEmployee,
                messagePrompt.updateRole,
                messagePrompt.exit
            ]
        })
        .then(answer => {
            console.log('answer', answer);
            switch (answer.action) {
                case messagePrompt.viewAllEmployees:
                    viewAllEmployees();
                    break;

                case messagePrompt.viewByDepartment:
                    viewByDepartment();
                    break;

                case messagePrompt.viewByManager:
                    viewByManager();
                    break;

                case messagePrompt.addEmployee:
                    addEmployee();
                    break;

                case messagePrompt.removeEmployee:
                    remove('delete');
                    break;

                case messagePrompt.updateRole:
                    remove('role');
                    break;

                case messagePrompt.viewAllRoles:
                    viewAllRoles();
                    break;

                case messagePrompt.exit:
                    connection.end();
                    break;
            }
        });
}