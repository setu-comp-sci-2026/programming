import org.w3c.dom.ls.LSOutput;

import java.util.Scanner;

public class Driver {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        //create a CarPurchaseHelper Object called carPurchaserHelper
        int choice = input.nextInt();

        //call welcome message
        while (choice != 0) {
            //print menu
            //user enters choice

            //if user chooses HP

            /*  you can uncomment and use
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


            //if user chooses PCP
                // --- PCP Calculation ---



                System.out.print("Enter car price: ");
                double pcpPrice = input.nextDouble();
            //Ask user to enter all the information required for
            //calculation and call the appropriate method


            //Add in remaining choices for the methods you have written
            //in the CarPurchaseHelper class





            // don't forget to update choice (LCV)
            }
        //print goodbye message
        }

    }


