module.exports = {


  friendlyName: 'View book',


  description: 'Display "Book" page.',


  exits: {

    success: {
      viewTemplatePath: 'pages/books/book'
    }

  },


  fn: async function (inputs, exits) {

    let id = this.req.param('id');
    let book = await BooksCommentsView.find().where({ 'id' : id });
   
    // Respond with view.
    return exits.success({
      book
    });
  }


};
