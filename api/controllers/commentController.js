/**
 * CommentController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */


module.exports = {
  
    delete: function(req, res){
        Comments.destroyOne({id:req.params.id}).exec(function(err){
            if(err){
                res.send(500, {error: 'Database Error'})
            }
            res.redirect('/');
        })
    }

};

