Untuk start ketik -> node server
Link: localhost:3000
====================================================================================
GET 	/chat  			mengambil semua chat public  
POST 	/chat			insert
DELETE	/chat/:id		delete

GET 	/chat/grup/:id   	mengambil semua chat grup berdasarkan id    
POST 	/chat/grup/:id		insert grup chat

GET 	/grup			mengambil semua grup
POST	/grup			insert
PUT 	/grup/changename/:id	mengganti nama grup
PUT	/grup/changepass/:id	mengganti pass grup
DELETE	/grup/:id		delete

GET	/message		mengambil semua message
GET	/message/:id		mengambil message berdasarkan id
POST	/message/secret		insert secret message (pake password)
POST 	/message/public		insert public message (tanpa password)
PUT 	/message/:id		update
DELETE	/message/:id		delete
====================================================================================
Example
1. Secret Message
Link: http://localhost:3000/message/secret
Body: 
{
"content":"test message secret",
"password":"test"
}
------------------------------------------------------------------------------------
2. Public message
Link: http://localhost:3000/message/public
Body: 
{
"content":"test message pub"
}
------------------------------------------------------------------------------------
3. Grup Chat
Link: http://localhost:3000/chat/grup/1
Body: 
{
"username":"test",
"content":"test grup chat"
}
------------------------------------------------------------------------------------
4. Chat
Link: http://localhost:3000/chat
Body: 
{
"username":"test",
"content":"test chat"
}
------------------------------------------------------------------------------------
5. Grup
Link: http://localhost:3000/grup
Body: 
{
"name":"testgrup",
"password":"test"
}
------------------------------------------------------------------------------------
6. Change Grup Pass
Link: http://localhost:3000/grup/1
Body: 
{
"password":"test123"
}
------------------------------------------------------------------------------------
7. Change Grup Name
Link: http://localhost:3000/grup/1
Body: 
{
"name":"test123"
}
------------------------------------------------------------------------------------

