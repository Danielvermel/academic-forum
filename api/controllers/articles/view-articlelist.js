module.exports = {


  friendlyName: 'View articlelist',


  description: 'Display "Articlelist" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/articles/articlelist'
    }

  },


  fn: async function (inputs, exits) {

    let articles = await ArticlesView.find();

    // Respond with view.
    return exits.success({
      articles
    });
  }


};
