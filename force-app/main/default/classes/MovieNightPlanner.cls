public class MovieNightPlanner {
    public static void planMovieNight() {
        // Create a list of 5 movies in order
        List<String> movieList = new List<String>{
            'Inception', 'The Matrix', 'Interstellar', 'Avatar', 'Titanic'
        };
        System.debug('Initial movie list: ' + movieList);
        
        // Add "Intermission Break" after the 2nd movie (index 2)
        movieList.add(2, 'Intermission Break');
        System.debug('After adding intermission: ' + movieList);
        
        // Friend suggests adding "The Avengers" at the very beginning
        movieList.add(0, 'The Avengers');
        System.debug('After adding The Avengers at beginning: ' + movieList);
        
        // Check if "Titanic" is in the movie list
        Boolean hasTitanic = movieList.contains('Titanic');
        System.debug('Is Titanic in the list? ' + hasTitanic);
        
        // Find position of "Intermission Break"
        Integer intermissionPosition = movieList.indexOf('Intermission Break');
        System.debug('Intermission Break is at position: ' + intermissionPosition);
        
        // Remove the last movie from the list
        movieList.remove(movieList.size() - 1);
        System.debug('After removing last movie: ' + movieList);
        
        // Print total items in final list
        System.debug('Total items in final list: ' + movieList.size());
    }
}