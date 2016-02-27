# ----------------------------------------
#  title: "Loan Payment Calculator Server"
# author: "Peter Whitney"
#   date: "Feb 27, 2016"
# output: html_document
# ----------------------------------------
#
# This is the shiny server code
#
# It receives the input variable entered by the user
# and passes these to a locally defined function which
# calculates the monthly payment for the input loan terms
#
# The calculated monthly loan payment is returned to the
# submission form and rendered to the user in the verbatim
# text output field
#
shinyServer(
  function(input, output) {
    output$payment <- renderPrint({calculatePayment(input$loanAmount, input$interestRate, input$term)})
    output
  }
)

calculatePayment <- function(amount, interest_rate, term_years) {
  interest_per_period <- interest_rate / 100 / 12
  term_months <- term_years * 12
  result <- (interest_per_period * (1 + interest_per_period)^term_months) / ((1 + interest_per_period)^term_months - 1)
  result <- result * amount
  round(result, 2)
}
