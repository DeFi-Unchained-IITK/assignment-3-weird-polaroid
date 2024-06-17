// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "/home/adityaprakhar/Defi-Unchained/assignment-3-weird-polaroid/Assignment3/Employee.sol";

contract EmployeeRegistreeTest is Test {
    EmployeeRegistree public employeeRegistree;

    function setUp() public {
        employeeRegistree = new EmployeeRegistree();
    }

    function testAddEmployee() public {
        employeeRegistree.addEmployee("Alice", "Developer", 1000);
        (string memory name, string memory position, uint salary) = employeeRegistree.getEmployeeDetails(1);
        assertEq(name, "Alice");
        assertEq(position, "Developer");
        assertEq(salary, 1000);
    }

    function testUpdateEmployee() public {
        employeeRegistree.addEmployee("Bob", "Designer", 800);
        employeeRegistree.updateEmployee(1, "Bob", "Senior Designer", 1200);
        (string memory name, string memory position, uint salary) = employeeRegistree.getEmployeeDetails(1);
        assertEq(name, "Bob");
        assertEq(position, "Senior Designer");
        assertEq(salary, 1200);
    }

    function testGetEmployeeDetails() public {
        employeeRegistree.addEmployee("Charlie", "Manager", 1500);
        (string memory name, string memory position, uint salary) = employeeRegistree.getEmployeeDetails(1);
        assertEq(name, "Charlie");
        assertEq(position, "Manager");
        assertEq(salary, 1500);
    }

    function testDeleteEmployee() public {
        employeeRegistree.addEmployee("Dave", "Analyst", 900);
        employeeRegistree.deleteEmployee(1);
        vm.expectRevert("Employee not found");
        employeeRegistree.getEmployeeDetails(1);
    }
}