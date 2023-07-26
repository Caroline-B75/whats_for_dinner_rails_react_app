const allowPopovers = () => {
  $(function () {
    $('[data-bs-toggle="popover"]').popover({
      html : true,
    });
  });
};

export { allowPopovers };
