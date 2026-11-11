public class CarPurchaserHelper {
//This will be given to students,
// ToDO: explain it in the reflection
    public double calculateHP(double carPrice, double deposit, double annualInterest, int termYears) {
        double amountToFinance = carPrice - deposit;
        double monthlyInterestRate = (annualInterest / 100) / 12;
        int totalMonths = termYears * 12;

        if (monthlyInterestRate == 0) {
            return amountToFinance / totalMonths;
        } else {
            // Calculate (1 + r)^n using a loop
            double factor = 1;
            for (int i = 0; i < totalMonths; i++) {
                factor *= (1 + monthlyInterestRate);
            }

            double monthlyPayment = amountToFinance * monthlyInterestRate * factor / (factor - 1);
            return monthlyPayment;
        }
    }
    //This will be given to students,
// ToDO: explain it in the reflection
    public double pcpResultMonth(double carPrice, double deposit, double annualInterest, int termYears, double gmfvPercent) {
        double gmfv = carPrice * (gmfvPercent / 100);
        double amountToFinance = carPrice - deposit - gmfv;

        double monthlyInterestRate = (annualInterest / 100) / 12;
        int totalMonths = termYears * 12;

        double monthlyPayment;

        if (monthlyInterestRate == 0) {
            monthlyPayment = amountToFinance / totalMonths;
        } else {
            // Calculate (1 + r)^n using a loop
            double factor = 1;
            for (int i = 0; i < totalMonths; i++) {
                factor *= (1 + monthlyInterestRate);
            }

            monthlyPayment = amountToFinance * monthlyInterestRate * factor / (factor - 1);
        }

        return  monthlyPayment;
    }
//ToDo: Write a method called printWelcomeMessage() - returns a String

//ToDo: Write a method called printGoodbyeMessage() - returns a String

//ToDo:Write a method called calculateMonthlyCost(double, int) returns a double
// Calculates a rough monthly payment if the car is paid off over
// a number of months.
// Parameters : price of car and number of months

//ToDo: Write a method called fuelCostEstimator(double, double) returns a double
// Estimates weekly fuel cost (e.g., assuming 6L per 100 km).
// Parameters : kilometres per week and cost of fuel
// work out litres per week by dividing weekly kms by 100 and mulitplying by 6, then multiply by cost


//ToDo: Write a method called recommendCarType(String) returns a String
// Gives a recommendation based on the user's lifestyle
// (Parameter : requirement e.g., “family,” “commute,” “adventure”).



}

