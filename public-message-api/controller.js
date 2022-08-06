'use strict';

var response = require('./res');
var connection = require('./conn');

//chat
exports.chat = function(req, res){
     var query = 'SELECT * FROM chat WHERE grup_id = 0';
     connection.query(query, function(error, rows, fields){
	if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
     });
};

exports.grupChat = function(req, res){
     var id = req.params.id;
     var query = 'SELECT * FROM chat WHERE grup_id ='+id;
     connection.query(query, function(error, rows, fields){
	if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
     });
};

exports.insertChat = function(req, res){
    var username = req.body.username;
    var content = req.body.content;
    //var dateNow = req.body.dateNow;
    var grupId = 0;

    connection.query('INSERT INTO chat (username, content, /*date,*/ grup_id) values (?,?,?)',
    [username, content, /*dateNow,*/ grupId], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menambahkan chat!", res)
        }
    });
};

exports.insertGrupChat = function(req, res){
    var username = req.body.username;
    var content = req.body.content;
    //var dateNow = req.body.dateNow;
    var grupId = req.params.id;

    connection.query('INSERT INTO chat (username, content, /*date,*/ grup_id) values (?,?,?)',
    [username, content, /*dateNow,*/ grupId], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menambahkan chat!", res)
        }
    });
};

exports.deleteChat = function(req, res) {
    var id = req.params.id;

    connection.query('DELETE FROM chat WHERE id = ?',
    [ id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menghapus chat!", res)
        }
    });
};

//grup
exports.grup = function(req, res){
     var query = 'SELECT * FROM grup';
     connection.query(query, function(error, rows, fields){
	if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
     });
};

exports.insertGrup = function(req, res){
    var grupname = req.body.name;
    var gruppass = req.body.password;

    connection.query('INSERT INTO grup (name, password) values (?,?)',
    [grupname, gruppass], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menambahkan grup!", res)
        }
    });
};

exports.updateGrupName = function(req, res) {
    
    var id = req.params.id;
    var grupname = req.body.name;

    connection.query('UPDATE grup SET name = ? WHERE id = ?',
    [ grupname, id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil merubah buku!", res)
        }
    });
};

exports.updateGrupPass = function(req, res) {
    
    var id = req.params.id;
    var gruppass = req.body.password;

    connection.query('UPDATE grup SET password = ? WHERE id = ?',
    [ gruppass, id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil merubah buku!", res)
        }
    });
};

exports.deleteGrup = function(req, res) {
    var id = req.params.id;

    connection.query('DELETE FROM grup WHERE id = ?',
    [ id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menghapus grup!", res)
        }
    });
};




//message
exports.message = function(req, res){
     var query = 'SELECT * FROM message';
     connection.query(query, function(error, rows, fields){
	if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
     });
};

exports.getMessage = function(req, res){
     var id = req.params.id;
     var query = 'SELECT * FROM message WHERE id ='+id;
     connection.query(query, function(error, rows, fields){
	if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
     });
};

exports.insertSecretMessage = function(req, res){
    var content = req.body.content;
    var type = 1;
    var pass = req.body.password;

    connection.query('INSERT INTO message (content, type, password) values (?,?,?)',
    [content, type, pass], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menambahkan pesan!", res)
        }
    });
};

exports.insertPublicMessage = function(req, res){
    var content = req.body.content;
    var type = 0;
    var pass = "";

    connection.query('INSERT INTO message (content, type, password) values (?,?,?)',
    [content, type, pass], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menambahkan pesan!", res)
        }
    });
};

exports.updateMessage = function(req, res) {
    
    var id = req.params.id;
    var content = req.body.content;
    var type = req.body.type;
    var pass = req.body.password;

    connection.query('UPDATE message SET content = ?, type = ?, password = ? WHERE id = ?',
    [ content, type, pass, id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil merubah buku!", res)
        }
    });
};

exports.deleteMessage = function(req, res) {
    var id = req.params.id;

    connection.query('DELETE FROM message WHERE id = ?',
    [ id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menghapus pesan!", res)
        }
    });
};



exports.index = function(req, res) {
    response.ok("Public Message!", res)
};