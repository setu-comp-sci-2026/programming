

import java.util.Scanner;

public class Driver {
    public static void main(String[] args) {
        new Driver();
    }

    Driver() {
        Scanner input = new Scanner(System.in);
        //ToDo : create a CarPurchaseHelper Object called carPurchaserHelper
        //ToDo :print menu
        int choice = input.nextInt();

        //ToDo :call welcome message
        while (choice != 0) {


            //ToDo :if user chooses HP

            /* ToDo :  you can uncomment and use
             // --- HP Calculation ---
                System.out.print("Enter car price: ");
                double hpPrice = input.nextDouble();
                System.out.print("Enter deposit: ");
                double hpDeposit = input.nextDouble();
                System.out.print("Enter annual interest rate (%): ");
                double hpInterest = input.nextDouble();
                System.out.print("Enter term in years: ");
                int hpTerm = input.nextInt();

                double hpMonthly = carPurchaserHelper.calculateHP(hpPrice, hpDeposit, hpInterest, hpTerm);
                System.out.println("Monthly HP payment: €" + hpMonthly);
             */


            //ToDo :if user chooses PCP
            // --- PCP Calculation ---


            System.out.print("Enter car price: ");
            double pcpPrice = input.nextDouble();
            //ToDo :Ask user to enter all the information required for
            //calculation and call the appropriate method


            //ToDo :Add in remaining choices for the methods you have written
            //in the CarPurchaseHelper class


            //ToDo :print menu
            //ToDo :user enters choice

        }
        //ToDo :print goodbye message
    }

}


