/**
 * Articles.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {
    id: {type: 'number', columnName: 'articleId', required: true},
    journalIssueNumber: {type: 'number', required: true},
    journalPublished: {type: 'string', required: true},
    articleInfoId: {type: 'number', required: true},
  },
};

