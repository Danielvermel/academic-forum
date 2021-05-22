/**
 * EssentialInfo.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {

  attributes: {
    id: {type: 'number', columnName: 'infoid', required: true},
    title: {type: 'string', required: true},
    author: {type: 'string', required: true},
    publicationDate: {type:'number', required: true},
    urlCoverPhoto: {type: 'string', required: true},
    comments: {model: 'comments'}
  },

};

