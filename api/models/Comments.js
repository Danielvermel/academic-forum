/**
 * BooksCommentsView.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
    id: {type: 'number', columnName: 'commentId', required: true},
    content: {type: 'string', required: true},
    creator: {type: 'string', required: true},
    creationDate: {type: 'ref', required: true},
    articleId: {
      model:'Articles'
    },
    bookId: {
      model:'Books'
    }
  },
  tableName: 'comments'
};