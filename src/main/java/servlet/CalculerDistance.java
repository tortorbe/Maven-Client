package servlet;

 


import java.io.IOException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;

 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 

import bean.VilleFrance;
import utilitaire.RestResponse;

 


/**
 * Servlet implementation class CalculerDistance
 */
@WebServlet("/CalculerDistance")
public class CalculerDistance extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String ATT_LISTE_VILLES = "listeVilles";
    private static final String ATT_DISTANCE = "distance";
    private static final String VUE_FORM = "/calculerDistance.jsp";
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculerDistance() {
        super();
        // TODO Auto-generated constructor stub
    }

 

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        List<VilleFrance> villes;
        villes = RestResponse.getAll();
        session.setAttribute(ATT_LISTE_VILLES, villes);
        
        this.getServletContext().getRequestDispatcher(VUE_FORM).forward(request, response);    
    }

 

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session = request.getSession();
        
        
        
        String idVille1 = request.getParameter("choixVille1");
        String idVille2 = request.getParameter("choixVille2");
        
        
        VilleFrance ville1 = new VilleFrance();
        
        
        
        HashMap<String, String> args = new HashMap<String,String>();
        args.put("codeCommune", idVille1);
        
        try {
            ville1 = RestResponse.getWithParams(args).get(0);
        }catch(URISyntaxException | IOException e) {
            e.printStackTrace();
        }
        
        
        VilleFrance ville2 = new VilleFrance();
        
        
        HashMap<String, String> args2 = new HashMap<String,String>();
        args2.put("codeCommune", idVille2);
        
        try {
            ville2 = RestResponse.getWithParams(args2).get(0);
        }catch(URISyntaxException | IOException e) {
            e.printStackTrace();
        }
        
        double distance = calculerDistance(ville1, ville2);
        
        
        
        
        session.setAttribute(ATT_DISTANCE,distance);
        
        
        this.doGet(request, response);
    }
    
    
    
    
    
    public double calculerDistance(VilleFrance ville1, VilleFrance ville2) {
        
        double distance = 0;
        
        double longitudeA = Double.valueOf(ville1.getLongitude());
        double longitudeB = Double.valueOf(ville2.getLongitude());
        
        double latitudeA = Double.valueOf(ville1.getLatitude());
        double latitudeB = Double.valueOf(ville2.getLatitude());
        
        
        double first = (longitudeB - longitudeA) * Math.cos((latitudeB + latitudeA)/2);
        
        double second = latitudeB - latitudeA;
        
        double third = Math.sqrt(Math.pow(first, 2) + Math.pow(second, 2));
        
        distance = 1.852 * 60 * third;
        
        
        return distance;
    }
    
    
    
    
    

 

}
