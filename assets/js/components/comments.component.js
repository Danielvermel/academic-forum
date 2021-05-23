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

  template: `
    <section>
      <h3>Comments</h3>
        <ul class="list-group list-group-flush comments">
          <li class="list-group-item" v-for="comments in data">
          <div class="d-flex justify-content-between">
            <span><strong>{{comments.creator}}</strong></span>
            <span>{{comments.creationDate}}</span>
          </div>
            <span class="mt-2">{{comments.content}}</span>
          </li>
        </ul>
    </section>
  `,
});
