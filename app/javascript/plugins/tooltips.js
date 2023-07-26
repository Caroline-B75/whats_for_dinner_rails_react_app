const allowTooltips = () => {
  $(document).ready(function(){
      $('[data-bs-toggle="tooltip"]').tooltip();
  });
};

export { allowTooltips };
