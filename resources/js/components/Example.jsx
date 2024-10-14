import React, {useState, useEffect } from 'react';
import ReactDOM from 'react-dom/client';
import axios from 'axios';

function Example() {
   const [movies, setMovies] = useState([])
const fetchData = async () => {
try {
    axios.get('http://localhost:8000/api/movies').then((response)  => {
        setMovies(response.data);
        });
    
    }catch(error){
     console.log(error)
    }
}
useEffect(() => {
    fetchData();
}, [])

    return (
        <div className="container">
            <div className="row justify-content-center">
                <div className="col-md-8">
                    <div className="card">
                        <div className="card-header">Autósmozi tesztfeladat</div>

                        <div className="card-body">Filmek</div>
                        <ul>
                            {movies.map(movie => (
                                <div><hr></hr><li key={movie.id}>
                                <b>Cím: {movie.title}</b>                                     <br></br>
                                </li>
                                <b>Leírás: </b> 
                                {movie.description}<br></br>
                                <b>Korhatár: </b>{movie.age_rating} év<br></br>
                                <b>Nyelv: </b>{movie.language}<br></br>
                                <b>Vetítés időpontja: </b>{movie.release.date} óra <br></br>
                                <b>Szabad helyek: </b>{movie.release.available_seats} db <br></br>
                                <b>Borítókép:</b> <br></br><img src={movie.cover_image} alt="cover image"></img>
                                <br></br>
                                </div>
                            ))}
                            </ul>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Example;

if (document.getElementById('example')) {
    const Index = ReactDOM.createRoot(document.getElementById("example"));

    Index.render(
        <React.StrictMode>
            <Example/>
        </React.StrictMode>
    )
}
