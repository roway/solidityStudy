// SPDX-License-Identifier: GPL-3.0
pragma solidity  >=0.7.0 <0.9.0;

contract Coin{
    // 关键字“public”让这些变量可以从外部读取
    address public minter;
    mapping(address => uint) public balance;

    // 轻客户端可以通过事件针对变化作出高效的反应
    event Sent(address from,address to,uint amount);

    // 这是构造函数，只有当合约创建时运行
    constructor(){
        minter = msg.sender;
    }

    function mint(address receiver,uint amount) public{
        require(msg.sender == minter);
        require(amount <1e60); //这是什么意思？
        balance[receiver] += amount;
    }

    function send(address receiver,uint amount) public{
        require(amount <= balance[msg.sender],"Insufficient balance");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Sent(msg.sender,receiver,amount);
    }

}