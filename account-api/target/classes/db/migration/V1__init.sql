--
-- PostgreSQL database dump complete
--


INSERT INTO accounts.users
(id, activated, email, password, resetpasswordkey, username)
VALUES(6, true, 'mmerida@netsuite.com', '12345', '12345', 'mmerida0');

INSERT INTO accounts.accounts
(id, userid, identifier, balance, creationdate, expirationdate, activated, activationkey)
VALUES(0, 6, 'ESB5673445677675679DR', 1200, '2017-01-29', '2017-01-29', true, NULL::character varying);

INSERT INTO accounts.trantype
(id, "name", description)
VALUES(1, 'DEPOSIT', NULL::character varying);

INSERT INTO accounts.trantype
(id, "name", description)
VALUES(2, 'WITHDRAW', NULL::character varying);

INSERT INTO accounts.operationtype
(id, "name", description)
VALUES(0, 'TYPE0', NULL::character varying);

INSERT INTO accounts.operationtype
(id, "name", description)
VALUES(1, 'TYPE1', NULL::character varying);

INSERT INTO accounts.operationtype
(id, "name", description)
VALUES(2, 'TYPE2', NULL::character varying);

INSERT INTO accounts.transactions
(id, accountid, trantypeid, operationtypeid, detail, origin, destiny, amount, balance, "date")
VALUES(0, 0, 1, 0, 'My fisrt deposit', '', '', 1200, 1200, '2017-01-29');

INSERT INTO accounts.accounts
(id, activated, activationkey, balance, creationdate, expirationdate, identifier, userid)
VALUES(1, true, '321rewqrewr', 1200, '2017-01-29 00:00:00', '2017-01-29 00:00:00', '4c1c5729-9f42-407b-b9b5-432da9be173b', 6);


commit;