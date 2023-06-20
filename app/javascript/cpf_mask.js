document.addEventListener("DOMContentLoaded", function() {
    var cpfInput = document.getElementById("user_cpf");
    cpfInput.addEventListener("input", function() {
      var cpf = cpfInput.value.replace(/\D/g, "").slice(0, 11);
      cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
      cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
      cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
      cpfInput.value = cpf;
    });
  });
  