/**
 * ArticlesView.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
    id: {type: 'number', columnName: 'articleId', required: true},
    title: {type: 'string', required: true},
    author: {type:'string', required: true},
    description: {type:'string', required: true},
    publicationDate: {type:'ref', required: true},
    urlCoverPhoto: {type:'string', required: true},
    journalIssueNumber: {type: 'number', required: true},
    journalPublished: {type: 'string', required: true}
  },
  tableName: 'articlesView'

};

