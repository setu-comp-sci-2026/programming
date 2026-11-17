import java.util.Scanner;

public class Driver {
    private static Scanner input = new Scanner(System.in);
    CarPurchaserHelper carPurchaserHelper = new CarPurchaserHelper();;

    public static void main(String[] args) {
        new Driver();
    }
    Driver(){
        System.out.println(carPurchaserHelper.printWelcomeMessage());
        int choice = getNextChoice();

        while (choice != 6) {
            if(choice==1) {

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
            }

            else if(choice==2) {
                // --- PCP Calculation ---
                System.out.print("Enter car price: ");
                double pcpPrice = input.nextDouble();
                System.out.print("Enter deposit: ");
                double pcpDeposit = input.nextDouble();
                System.out.print("Enter annual interest rate (%): ");
                double pcpInterest = input.nextDouble();
                System.out.print("Enter term in years: ");
                int pcpTerm = input.nextInt();
                System.out.print("Enter GMFV percentage: ");
                double gmfvPercent = input.nextDouble();

                double pcpResultMonth = carPurchaserHelper.pcpResultMonth(pcpPrice, pcpDeposit, pcpInterest, pcpTerm, gmfvPercent);
                System.out.println("Monthly PCP payment: €" + pcpResultMonth);
               // System.out.println("GMFV (balloon payment): €%.2f%n", pcpResults[1]);
            }
            else if(choice==3) {
                System.out.print("How many km do you drive per week? ");
                double km = input.nextDouble();
                System.out.print("Current fuel price per litre: ");
                double fuelPrice = input.nextDouble();
                System.out.println("Estimated weekly fuel cost: €" + carPurchaserHelper.fuelCostEstimator(km, fuelPrice));

            }
            else if(choice==4) {
                System.out.print("Enter car price: ");
                int price = input.nextInt();
                System.out.print("Over how many months: ");
                int months = input.nextInt();
                System.out.println("Monthly payment: €" + carPurchaserHelper.calculateMonthlyCost(price, months));
            }
            else if(choice==5) {
                input.nextLine();
                System.out.print("What's your main need (family / commute / adventure)? ");
                String need = input.nextLine();
                System.out.println(carPurchaserHelper.recommendCarType(need));
            }



                else
                    System.out.println("Invalid choice. Try again.");

                choice = getNextChoice();
            }
        System.out.println(carPurchaserHelper.printGoodbyeMessage());
        }
    public static int getNextChoice(){
        System.out.println("\n=== Car Finance Calculator ===");
        System.out.println("1. Calculate HP");
        System.out.println("2. Calculate PCP");
        System.out.println("3. Calculate Fuel Cost");
        System.out.println("4. Calculate Monthly Cost");
        System.out.println("5. Recommend Car Type");
        System.out.println("6. Exit");
        System.out.print("Choose an option: ");
        int choice = input.nextInt();
        return choice;
      }
    }


