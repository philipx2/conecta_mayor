<?php
require_once '../../php/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;

// Configura las credenciales de Firebase
$factory = (new Factory)
    ->withServiceAccount('credentials_2.json'); // Ruta al archivo JSON de credenciales de Firebase

$messaging = $factory->createMessaging();

// Función para generar un mensaje aleatorio
function getRandomMessage() {
    $messages = ['Notificación aleatoria 1', 'Notificación aleatoria 2', 'Notificación aleatoria 3'];
    return $messages[array_rand($messages)];
}

$randomMessage = getRandomMessage();

try {
    $message = CloudMessage::fromArray([
        'notification' => [
            'title' => 'Título de la Notificación',
            'body' => $randomMessage,
        ],
        'topic' => 'prueba-conecta-mayor',
        'data' => [
            'title' => 'Título de la data',
            'body' => $randomMessage,
        ],
    ]);

    $response = $messaging->send($message);

    if ($response != null) {
        echo $randomMessage;
    } else {
        echo 'Error al enviar la notificación: No se pudo obtener una respuesta del servidor FCM.';
    }
} catch (Exception $e) {
    echo 'Error al enviar la notificación: ' . $e->getMessage();
}