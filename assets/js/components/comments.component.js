/**
 * <modal>
 * -----------------------------------------------------------------------------
 * A modal dialog pop-up.
 *
 * > Be careful adding other Vue.js lifecycle callbacks in this file!  The
 * > finnicky combination of Vue transitions and bootstrap modal animations used
 * > herein work, and are very well-tested in practical applications.  But any
 * > changes to that specific cocktail could be unpredictable, with unsavory
 * > consequences.
 *
 * @type {Component}
 *
 * -----------------------------------------------------------------------------
 */

parasails.registerComponent('comments', {

  props: {
    data: {
      type: Array,
      required: true
    },
  },

  data: function (){
    return {

    };
  },

  beforeMount: function() {
    this.data.sort((a, b) => (a.creationDate > b.creationDate) ? 1 : -1);
  },

  template: `
    <section>
      <h4>Comments</h4>
        <ul class="list-group list-group-flush mt-3">
          <li class="list-group-item" v-for="comment in data">
          <div class="d-flex justify-content-between mb-2">
            <span><strong>{{comment.creator}}</strong></span>
            <div class="d-flex jsutify-content-end">
              <span>
                {{comment.creationDate.slice(0,10)}} 
              </span>
              <form :action="'/comment/delete/' + comment.id" method="post" class="ml-2">
                <button type="submit" class="bg-white border-0">
                  <i class="texr-dark fa fa-times"></i>
                </button>
              </form>
            </div>
  
          </div>
            <span>{{comment.content}}</span>
          </li>
        </ul>
    </section>
  `,
});
