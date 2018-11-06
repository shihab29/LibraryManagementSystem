CREATE OR REPLACE PROCEDURE addMember(
		name in MEMBER.memberName%TYPE,
		address in MEMBER.memberAddress%TYPE,
		phone in MEMBER.memberPhone%TYPE,
		password in MEMBER.memberPassword%TYPE
		)
		IS
BEGIN
	INSERT INTO MEMBER (memberId,memberName,memberAddress,memberPhone,memberPassword,receivedBook) VALUES (seqAddMember.nextval,name,address,phone,password,'NO');
	Commit;	
END addMember;
/