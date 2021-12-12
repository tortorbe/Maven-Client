package servlet;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.VilleFrance;
import utilitaire.RestResponse;

/**
 * Servlet implementation class AjouterVille
 */
@WebServlet("/AjouterVille")
public class AjouterVille extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterVille() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		this.getServletContext().getRequestDispatcher("/ajouterVille.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String codeCommune = request.getParameter("codeCommune");
		String codepostal = request.getParameter("codePostal");
		String nomcommune = request.getParameter("nomCommune");
		String libelle = request.getParameter("libelleacheminement");
		String ligne = request.getParameter("ligne5");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		
		VilleFrance ville= new VilleFrance();
		ville.setCode_commune_INSEE(codeCommune);
		ville.setCode_postal(codepostal);
		ville.setNom_commune(nomcommune);
		ville.setLibelle_acheminement(libelle);
		ville.setLigne_5(ligne);
		ville.setLatitude(latitude);
		ville.setLongitude(longitude);
		
		

		boolean modifeffec = false;
		try {
			modifeffec = RestResponse.post(ville);
			if(modifeffec) {
				session.setAttribute("villeModif", ville);
			}
		}catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request,response);
		
		//this.getServletContext().getRequestDispatcher("index.jsp").forward(request, response);	
	}


}
