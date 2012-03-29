$(function () {
  $.ajax({type: 'GET', url: '/api/ships/search', success: function(response) {
    console.log(response)
  }})
})
