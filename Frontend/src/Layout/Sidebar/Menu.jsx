// const userRole=localStorage.getItem('role');

// export const MENUITEMS = [
//   {
//     menutitle: "GÉNÉRAL",
//     menucontent: "Dashboards,Widgets",
//     Items: [
//          { path: '/Home', icon: "icofont-home", title: "Home", type: "link" },
//          { path: '/profile', icon: "icofont-ui-user", title: "Profile", type: "link" },
//         //  { path: '/password', icon: "icofont-settings-alt", title: "Setting", type: "link" },
//     ],
//   },

//     {
//     menutitle: "Applications",
//     menucontent: "Ready to use Apps",
    
//     Items:[
//       { path: 'members', icon: "icofont icofont-users-alt-1", title: "Members", type: "link" },
//       { path: '/', icon: "icofont-ui-user", title: "Logout", type: "link" },
//     ],
//   },


// ];


// export const MEMBERMENUITEMS = [
//   {
//     menutitle: "GÉNÉRAL",
//     menucontent: "Dashboards,Widgets",
//     Items: [
//          { path: '/Home', icon: "icofont-home", title: "Home", type: "link" },
//          { path: '/profile', icon: "icofont-ui-user", title: "Profile", type: "link" },
//         //  { path: '/password', icon: "icofont-settings-alt", title: "Setting", type: "link" },
//     ],
//   },

//     {
//     menutitle: "Applications",
//     menucontent: "Ready to use Apps",
    
//     Items:  [
//           { path: '/', icon: "icofont-ui-user", title: "Logout", type: "link" },
//         ],
//   },


// ];


export const MENUITEMS= ()=> {
  const userRole =localStorage.getItem('role');
  if(userRole==="admin"){
    return [
        {
          menutitle: "GÉNÉRAL",
          menucontent: "Dashboards,Widgets",
          Items: [
               { path: '/Home', icon: "icofont-home", title: "Accueil", type: "link" },
               { path: '/profile', icon: "icofont-ui-user", title: "Profil", type: "link" },
              //  { path: '/password', icon: "icofont-settings-alt", title: "Setting", type: "link" },
          ],
        },
      
          {
          menutitle: "Applications",
          menucontent: "Ready to use Apps",
          
          Items:[
            { path: 'members', icon: "icofont icofont-users-alt-1", title: "Membres", type: "link" },
            { path: '/', icon: "icofont-ui-user", title: "Déconnexion", type: "link" },
          ],
        },
      ]
  }
    return [
      {
        menutitle: "GÉNÉRAL",
        menucontent: "Dashboards,Widgets",
        Items: [
             { path: '/Home', icon: "icofont-home", title: "Accueil", type: "link" },
             { path: '/profile', icon: "icofont-ui-user", title: "Profil", type: "link" },
            //  { path: '/password', icon: "icofont-settings-alt", title: "Setting", type: "link" },
        ],
      },
    
        {
        menutitle: "Applications",
        menucontent: "Ready to use Apps",
        
        Items:[
          { path: '/', icon: "icofont-ui-user", title: "Déconnexion", type: "link" },
        ],
      },
    ]
  
  
}
