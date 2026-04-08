import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Введите N\n");
        int n = sc.nextInt();
        System.out.print("Введите массив до N\n");
        ArrayList<Integer> massiv = zapolnenie(n, sc);
        System.out.print("Введенный массив\n");
        printVector(massiv);
        System.out.print("\nКоличество элементов, равных предыдущему: ");
        System.out.println(countElements(massiv));
        sc.close();
    }

    public static int countElements(ArrayList<Integer> massiv) {
        int count = 0;
        for (int i = 1; i < massiv.size(); i++) {
            if (massiv.get(i).intValue() == massiv.get(i-1).intValue()){
                count++;
            }
        }
        return count;
    }

    public static ArrayList<Integer> zapolnenie(int n, Scanner sc) {
        ArrayList<Integer> massiv = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            int numbers = sc.nextInt();
            massiv.add(numbers);
        }
        return massiv;
    }

    public static void printVector(ArrayList<Integer> massiv) {
        for (int val : massiv) {
            System.out.print(val + " ");
        }
    }
}