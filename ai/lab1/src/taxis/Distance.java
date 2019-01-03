package taxis;

public class Distance {
    public static double computeDistance(Point src, Point dst) {
        int R = 6371; // Radius of the earth
        double latDistance = Math.toRadians(dst.x - src.x);
        double lonDistance = Math.toRadians(dst.y - src.y);
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) 
                + Math.cos(Math.toRadians(src.x)) * Math.cos(Math.toRadians(dst.x))* Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c * 1000; // convert to meters
        return distance;
    }
}
