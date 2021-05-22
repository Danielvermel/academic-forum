module.exports = {


  friendlyName: 'View articlelist',


  description: 'Display "Articlelist" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/articles/articlelist'
    }

  },


  fn: async function () {

    // Respond with view.
    return {};

  }


};
