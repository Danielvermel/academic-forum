module.exports = {


  friendlyName: 'View article',


  description: 'Display "Article" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/articles/article'
    }

  },


  fn: async function (inputs, exits) {

    let id = this.req.param('id');
    let article = await ArticlesCommentsView.find().where({ 'id' : id });

    // Respond with view.
    return exits.success({
      article
    });
  }


};
