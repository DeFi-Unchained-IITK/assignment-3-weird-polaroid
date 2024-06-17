// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EmployeeRegistree {
    struct Employee {
        uint ID;
        string name;
        string position;
        uint salary;
    }

    mapping (uint => Employee) public employees;
    uint public nextID;

    event EmployeeAdded(uint ID, string name, string position, uint salary);
    event EmployeeUpdated(uint ID, string name, string position, uint salary);
    event EmployeeDeleted(uint ID, string name, string position, uint salary);

    constructor() {
        nextID = 1;
    }

    function addEmployee(string memory _name, string memory _position, uint _salary) public {
        Employee storage newEmployee = employees[nextID];
        newEmployee.ID = nextID;
        newEmployee.name = _name;
        newEmployee.position = _position;
        newEmployee.salary = _salary;
        emit EmployeeAdded(nextID, _name, _position, _salary);
        nextID++;
    }

    function updateEmployee(uint _id, string memory _name, string memory _position, uint _salary) public {
        if (employees[_id].ID != 0) {
            employees[_id].name = _name;
            employees[_id].position = _position;
            employees[_id].salary = _salary;
            emit EmployeeUpdated(_id, _name, _position, _salary);
        } else {
            revert("Employee not found");
        }
    }

    function getEmployeeDetails(uint _id) public view returns (string memory, string memory, uint) {
        if (employees[_id].ID != 0) {
            return (employees[_id].name, employees[_id].position, employees[_id].salary);
        } else {
            revert("Employee not found");
        }
    }

    function deleteEmployee(uint _id) public {
        if (employees[_id].ID != 0) {
            emit EmployeeDeleted(_id, employees[_id].name, employees[_id].position, employees[_id].salary);
            delete employees[_id];
        } else {
            revert("Employee not found");
        }
    }
}