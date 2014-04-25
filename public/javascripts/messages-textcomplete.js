$('#message').textcomplete([
  {
    hash_tags: ['suggest.location.', 'suggest.date.', 'suggest.task.'],
    match: /\B#(\w*)$/,
    search: function (term, callback) {
      callback($.map(this.hash_tags, function (tag) {
        return tag.indexOf(term) === 0 ? tag : null;
      }));
    },
    index: 1,
    replace: function (tag) {
      return '#' + tag;
    }
  }
]).overlay([
  {
    match: /\B#([\w.])+/g,
    css: {'background-color': '#42CBEA'}
  }
]);