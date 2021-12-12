package servlet;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
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
 * Servlet implementation class AfficherVille
 */
@WebServlet("/AfficherVille")
public class AfficherVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String ATT_LISTE_VILLES = "listeVilles";
	private static final String VUE_FORM = "/afficherVille.jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficherVille() {
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
		System.out.println("coucou");
		villes = RestResponse.getAll();
		session.setAttribute(ATT_LISTE_VILLES, villes);
		this.getServletContext().getRequestDispatcher(VUE_FORM).forward(request, response);		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("modif");
		System.out.println(id);
		HashMap<String, String> args = new HashMap<String,String>();
		args.put("codeCommune", id);
		VilleFrance villeCherchee = new VilleFrance();
		try {
			villeCherchee = RestResponse.getWithParams(args).get(0);
		}catch(URISyntaxException | IOException e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("villeModif", villeCherchee);
		this.getServletContext().getRequestDispatcher("/ajouterVille.jsp").forward(request, response);	
	}

}
