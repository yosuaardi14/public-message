'use strict';

module.exports = function(app) {
    var publicMessageController = require('./controller');

    app.route('/')
        .get(publicMessageController.index);
    app.route('/chat')
        .get(publicMessageController.chat);
    app.route('/chat')
        .post(publicMessageController.insertChat);
    app.route('/chat/:id')
        .delete(publicMessageController.deleteChat);
    app.route('/chat/grup/:id')
        .get(publicMessageController.grupChat);
    app.route('/chat/grup/:id')
        .post(publicMessageController.insertGrupChat);

    app.route('/grup')
        .get(publicMessageController.grup);
    app.route('/grup')
        .post(publicMessageController.insertGrup);
    app.route('/grup/changename/:id')
        .put(publicMessageController.updateGrupName);
    app.route('/grup/changepass/:id')
        .put(publicMessageController.updateGrupPass);
    app.route('/grup/:id')
        .delete(publicMessageController.deleteGrup);


    app.route('/message')
        .get(publicMessageController.message);
    app.route('/message/:id')
        .get(publicMessageController.getMessage);
    app.route('/message/secret')
        .post(publicMessageController.insertSecretMessage);
    app.route('/message/public')
        .post(publicMessageController.insertPublicMessage);
    app.route('/message/:id')
        .put(publicMessageController.updateMessage);
    app.route('/message/:id')
        .delete(publicMessageController.deleteMessage);

};