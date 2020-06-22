public class ParkLocator {
 
    public static String[] country(String country)
    {
        String[] parks;
        ParkService.ParksImplPort parkLocator = new ParkService.ParksImplPort();
        return parkLocator.byCountry(country);
    }
}