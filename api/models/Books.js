/**
 * Books.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
    id: {type: 'number', columnName: 'bookId', required: true},
    publisher: {type: 'string', required: true},
    bookInfoId: {type: 'number', required: true},
  },


};

