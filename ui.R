# ----------------------------------
#  title: "Loan Payment Calculator UI"
# author: "Peter Whitney"
#   date: "Feb 27, 2016"
# output: html_document
# ----------------------------------
#
# This is the shiny UI code
#
# This code renders numeric input controls for the
# loan amount, interest rate, and loan term.
#
# A submit button is used to initiate the loan payment
# calculation. Upon submission the monthly loan payment 
# is calculated on the server and returned to the 
# submisison form in the verbatim text output field
#
shinyUI(pageWithSidebar(
  headerPanel("Loan Payment Calculator"),
  sidebarPanel(
    numericInput('loanAmount', 'Loan Amount', 0, 1, 100000),
    numericInput('interestRate', 'Interest Rate', 0, 1, 20),
    numericInput('term', 'Term (years)', 0, 1, 30),
    submitButton('Calculate'),
    h3('Monthly Payment'),
    verbatimTextOutput("payment")
  ),
  mainPanel(
  )
))