// SPDX-License-Identifier:GPL-3.0
pragma solidity ^0.7.0;

contract FirstContract{

    address owner; // ״̬����

    constructor(){
        owner = msg.sender;
    }

    // ��ȡ��ǰ��Լ�ĵ�ַ
	function getAddress() public view returns (address) {
		return address(this);
	}
    // ��ȡ��Լ��
    function checkBalance() external view returns(uint) {
        return address(this).balance;
    }
    // ��ȡ��Լ�����ߵĵ�ַ��
    function getOwnerBalance() public view returns(address){
        return owner;
    }
    // ��ȡ��Լ�����ߵ����(������������������ʱ)��
    function test() public view returns(uint){
        if(owner == msg.sender){
            return owner.balance;
        }else{
            return 0;
        }
    }

    // ��ȡ�����ߵĵ�ַ��    
    function getSendAddress() public view returns (address) {
		return msg.sender;
	}
    // ��ȡ�����ߵ���
    function getSendBalance() public view returns(uint){
        return msg.sender.balance;
    }


}