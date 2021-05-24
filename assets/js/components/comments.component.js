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
          <li class="list-group-item" v-for="comments in data">
          <div class="d-flex justify-content-between mb-2">
            <span><strong>{{comments.creator}}</strong></span>
            <span>{{comments.creationDate.slice(0,10)}}</span>
          </div>
            <span>{{comments.content}}</span>
          </li>
        </ul>
    </section>
  `,
});
