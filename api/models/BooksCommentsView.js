/**
 * BooksCommentsView.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
    id: {type: 'number', columnName: 'bookId', required: true},
    title: {type: 'string', required: true},
    author: {type:'string', required: true},
    publicationDate: {type:'number', required: true},
    urlCoverPhoto: {type:'string', required: true},
    publisher: {type: 'string', required: true},
    content: {type: 'string', required: true},
    creator: {type: 'string', required: true},
    creationDate: {type: 'number', required: true}
  },
  tableName: 'booksCommentsView'
};

