// SPDX-License-Identifier: GPL-3.0
pragma solidity  >=0.7.0 <0.9.0;

contract Coin{
    // �ؼ��֡�public������Щ�������Դ��ⲿ��ȡ
    address public minter;
    mapping(address => uint) public balance;

    // ��ͻ��˿���ͨ���¼���Ա仯������Ч�ķ�Ӧ
    event Sent(address from,address to,uint amount);

    // ���ǹ��캯����ֻ�е���Լ����ʱ����
    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver,uint amount) public{
        require(msg.sender == minter);
        require(amount <1e60); //����ʲô��˼��
        balance[receiver] += amount;
    }

    function send(address receiver,uint amount) public{
        require(amount <= balance[msg.sender],"Insufficient balance");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Sent(msg.sender,receiver,amount);
    }

}