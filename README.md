#This is the first version of our tool, now available on GitHub for you to explore and contribute to!

#DirDetect is a Bash tool for automated directory and path detection on web servers. It allows users to target specific directories, adjust delay between requests, enable verbose mode, and includes custom header options for bypassing certain HTTP restrictions.

#Features

    Customizable target paths for directory detection
    Optional bypass for specific paths
    Delay control for request throttling
    Verbose output mode for detailed response info
    Supports various HTTP methods (GET, POST, PATCH, TRACE)
    Custom header for potential 403 (Forbidden) bypass

#Requirements

    curl and figlet should be installed on the system.

#Installation

    1.Clone the repository: git clone https://github.com/Aliseifeddine/DirDetect.git   

    2.cd DirDetect

    3.Make the script executable: chmod +x DirDetect.sh

    4.Run the script: ./DirDetect.sh

#Usage

To run DirDetect, execute the following command and follow the prompts:

    ./DirDetect.sh

#Parameters (Interactive)

    Target: Specify the main target URL.
    List: Specify a default list or upload your own.
    Specific Path Bypass: Enter a path to bypass with custom headers, or press Enter to skip.
    Delay Between Requests: Define a delay (e.g., n for no delay).
    Verbose Mode: Enter Y for detailed output or N for summary mode.

#Example Output

The tool will display response codes and sizes for each path tested, e.g.:

    /admin --> 200 --> 5120 bytes

    /custom-path --> 403 --> Forbidden (bypassed with X-Custom-IP-Authorization)


#Notes

    1.Verbose mode saves response headers in dedicated files (auth.txt, headers.txt, PATCH.txt, etc.).
    
    2.To bypass 403 restrictions, the tool attempts various headers and HTTP methods on paths that return 403.
    
    3.This revision explicitly mentions the user's ability to upload a custom wordlist while also keeping the option to use the default one. Thank you for your patience!



    
