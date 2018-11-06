CREATE OR REPLACE PROCEDURE addAdmin(
		name in ADMIN.adminName%TYPE,
		address in ADMIN.adminAddress%TYPE,
		phone in ADMIN.adminPhone%TYPE,
		password in ADMIN.adminPassword%TYPE
		)
		IS
BEGIN
	INSERT INTO ADMIN (adminId,adminName,adminAddress,adminPhone,adminPassword) VALUES (seqAddAdmin.nextval,name,address,phone,password);	
	Commit;
END addAdmin;
/