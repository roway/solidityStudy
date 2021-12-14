// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.7.0;

contract FirstContract{

    address owner; // 状态变量

    constructor(){
        owner = msg.sender;
    }

    // 获取当前合约的地址
	function getAddress() public view returns (address) {
		return address(this);
	}
    // 获取合约余额。
    function checkBalance() external view returns(uint) {
        return address(this).balance;
    }
    // 获取合约所有者的地址。
    function getOwnerBalance() public view returns(address){
        return owner;
    }
    // 获取合约所有者的余额(仅当发送者是所有者时)。
    function test() public view returns(uint){
        if(owner == msg.sender){
            return owner.balance;
        }else{
            return 0;
        }
    }

    // 获取发送者的地址。    
    function getSendAddress() public view returns (address) {
		return msg.sender;
	}
    // 获取发送者的余额。
    function getSendBalance() public view returns(uint){
        return msg.sender.balance;
    }


}