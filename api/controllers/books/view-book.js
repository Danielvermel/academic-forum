module.exports = {


  friendlyName: 'View book',


  description: 'Display "Book" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/books/book'
    }

  },


  fn: async function () {

    // Respond with view.
    return {};

  }


};
