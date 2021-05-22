module.exports = {


  friendlyName: 'View booklist',


  description: 'Display "Booklist" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/books/booklist'
    }

  },


  fn: async function () {

    // Respond with view.
    return {};

  }


};
