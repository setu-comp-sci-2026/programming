public class CarPurchaserHelper {

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
//Prints a friendly welcome message. Student writes
    public String printWelcomeMessage() {
        return "Welcome to the Car Helper Program!\nLet's find the perfect car for you ";
    }

    //Prints a friendly welcome message. Student writes
    public String printGoodbyeMessage() {
        return "Thanks for using our Car Helper Program!\nHope you found the perfect car for you ";
    }
//Calculates a rough monthly payment if the car is paid off over a number of months. - Student writes
    public double calculateMonthlyCost(double price, int months) {
        double monthly = price / months;
        return monthly;
    }
    //Estimates weekly fuel cost (e.g., assuming 6L per 100 km). Student writes
    public double fuelCostEstimator(double kmPerWeek, double fuelPrice) {
        double litresPerWeek = (kmPerWeek / 100) * 6;
        return litresPerWeek * fuelPrice;
    }
    //Gives a recommendation based on the user's lifestyle (e.g., “family,” “commute,” “adventure”).
    //student writes
    public String recommendCarType(String need) {
        if (need.equalsIgnoreCase("family")) {
            return "You might like an SUV or a spacious hatchback.";
        } else if (need.equalsIgnoreCase("commute")) {
            return "A small, fuel-efficient car would be perfect for you.";
        } else if (need.equalsIgnoreCase("adventure")) {
            return "Consider a 4x4 or crossover for your next road trip!";
        } else {
            return "Hmm, not sure — maybe test drive a few options!";
        }
    }


}

